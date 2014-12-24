class ExamPdf < Prawn::Document
  def initialize(event_id, event_exam_id, company_name, date_print, view)
  super()
    @event = Event.find(event_id)
    @event_exam = @event.exams.find(event_exam_id)
    @company_name = company_name
    @date_print = date_print
    @view = view
    header
    # content
    # footer
  end

  def precision(num)
    @view.number_with_precision(num, :delimiter => ",", :separator => ".", :precision => 0)
  end

  def delimiter(num)
    @view.number_with_delimiter(num, :delimiter => ",", :separator => ".")
  end

  def logo
    # logopath =  "#{Rails.root}/public/assets/company_logo/logo.png"
    # image logopath, :width => 110, :height => 60, :position => :center, :vposition => :top
  end

  def check_mark
    # logopath =  "#{Rails.root}/app/assets/images/heavy_check_mark.png"
    # image logopath, :width => 10, :height => 10, :position => :center, :vposition => :top
  end

  def header
    font("Times-Roman") do
      number_pages "" # dunno just make the formatting right
      text "#{@company_name}", :align => :center, :size => 10, :style => :bold
      text "#{@event_exam.exam_type}", :align => :center, :size => 10, :style => :bold
    end
  end

  def event_information
    [["Tanggal", ": #{I18n.l @event.try(:date_start)} s/d #{I18n.l @event.try(:date_end)}"],
     ["Tempat", ": UPT. Pelatihan dan Pengembangan Pendidikan Kejuruan"],
     ["", "  JL. Prof. Moch. Yamin No. 25, Kampus Unesa Kentintang, Surabaya"],
     ["Biaya", ": Seluruh biaya operasional pelatihan di tanggung oleh APBD Dinas Pendidikan Provinsi Jawa Timur"],
     ["Kedatangan Peserta", ": #{I18n.l @event.try(:date_start).to_time.localtime, :format => "%A, %d %B %Y"}"]]
  end

  def content
    move_down 20
    font("Times-Roman", :size => 10) do
      text "Bersama ini disampaikan dengan hormat bahwa UPT. Pelatihan dan Pengembangan Pendidikan Kejuruan (UPT PPPK) Dinas Pendidikan Provinsi Jawa Timur, pada tahun #{@event.try(:date_start).try(:year)} akan menyelenggarakan Pelatihan Peningkatan Kompetensi Guru untuk Guru SMK se Jatim. Pelatihan akan diselenggarakan pada:"
    end

    move_down 15
    table event_information, :cell_style => { :font => "Times-Roman", :size => 10, :height => 18 }, :width => 540 do
      cells.borders=[]
    end

    move_down 15
    font("Times-Roman", :size => 10) do
      text "Sehubungan dengan hal tersebut diminta bantuan Saudara agar mengirimkan Guru sesuai data terlampir dengan ketentuan sebagi berikut:"

      move_down 15
      text "1. Identitas lengkap Guru dan jurusan sesuai dengan yang telah disepakati dalam pendaftaran."
      text "2. Membawa Surat Keterangan Sehat dari Dokter, Surat tugas dari Sekolah, pakaian olah raga dan Foto Copy NPWP (bila ada)."

      move_down 15
      text "Selanjutnya pendaftaran peserta selambat-lambatnya tanggal <b>#{I18n.l @event.try(:date_start) - 3}</b> harus sudah didaftarkan ke UPT PPPK secara langsung Telp. <b>031 8291795</b> atau melalui Fax <b>031 8288677</b>, dan diminta perhatiannya agar pengiriman Guru sesuai dengan kuota, mengingat daya tampung yang tersedia."

      move_down 15
      text "Demikian untuk menjadikan maklum dan atas perhatiannya disampaikan terima kasih."
    end
  end

  def signed
    [["", "", "KEPALA"],
     ["", "", "UPT. PELATIHAN DAN PENGEMBANGAN"],
     ["", "", "PENDIDIKAN KEJURUAN



      "],
     ["Tembusan: ", "", "[kepala UPT]"],
     ["Yth. Kepala Dinas Pendidikan Provinsi Jawa Timur", "", "[kepala UPT jabatan]"],
     ["", "", "NIP. [nip kepala UPT]"]]
  end

  def footer
    move_down 20
    table signed, :cell_style => { :font => "Times-Roman", :size => 10, :height => 18 }, :width => 540 do
      cells.borders=[]
    end
  end

  def teacher_list
    
  end
end