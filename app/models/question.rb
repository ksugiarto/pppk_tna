class Question < ActiveRecord::Base
	belongs_to :event_exam
	belongs_to :subject
  # has_many :choices, :class_name => "QuestionChoice"

  attr_accessible :answer_1, :answer_2, :answer_3, :answer_4, :content, :event_exam_id, :notes, :right_answer, :score, :subject_id, :seq_num

  def self.import(file, event_id, event_exam_id)
    event = Event.find(event_id)
    event_exam = event.exams.find(event_exam_id)

    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

	    teacher = Teacher.find(row["ID Guru"])
      question_number = 1

    	teacher_answer = TeacherAnswer.create(:teacher_id => teacher.id, :event_exam_id => event_exam.id, :score => 0)

    	# CREATE TEACHER ANSWER DETAIL
      while row["#{question_number}"].present? do
      	question = event_exam.questions.where(:seq_num => question_number).last

      	#check answer incasesensitive
      	if row["#{question_number}"].casecmp("a")==0
      		answer = 1
      	elsif row["#{question_number}"].casecmp("b")==0
      		answer = 2
      	elsif row["#{question_number}"].casecmp("c")==0
      		answer = 3
      	elsif row["#{question_number}"].casecmp("d")==0
      		answer = 4
      	else answer = 0
      	end
      	answer.to_i==question.right_answer.to_i ? is_correct=1 : is_correct=0

      	teacher_answer.details.create(:question_id => question.id, :subject_id => question.subject_id, :answer => answer, :is_correct => is_correct.to_i)

      	question_number+=1
      end
    	# END CREATE TEACHER ANSWER DETAIL
    end

    # UPDATE COMPETENCY FROM THE TEACHER
    vocational = Vocational.find(event.vocational_id)
    core_competencies = vocational.core_competencies.all

    core_competencies.each do |core|
    	core.basic_competencies.all.each do |basic|
    		basic.subjects.all.each do |subject|

    			event_exam.teacher_answers.all.each do |teacher_answer|
    				details = teacher_answer.details.where(:subject_id => subject.id)
    				details.each do |detail|
    					result = (details.sum(:is_correct)/details.count)*100
    					if result>=65
    						teacher_subject_detail = teacher_answer.try(:teacher).subjects.where(:basic_competency_id => basic.id).last.details.where(:subject_id => subject.id).last
    						teacher_subject_detail.update_attributes(:is_competent => 1)
    					end
    				end
    			end

    		end
    	end
    end
    # END UPDATE COMPETENCY FROM THE TEACHER
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
