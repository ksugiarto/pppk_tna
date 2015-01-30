class TeacherVocational < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :vocational

  attr_accessible :notes, :teacher_id, :vocational_id

  def self.filter_nip(nip)
    if nip.present?
      joins(:teacher).where("teachers.nip ~* '#{nip}'")
    else
      scoped
    end
  end

  def self.filter_name(name)
    if name.present?
      joins(:teacher).where("teachers.first_name ~* ? OR teachers.last_name ~* ?", name, name)
    else
      scoped
    end
  end
end
