class ExamPdf < Prawn::Document
  def initialize(event_id, event_matter_id, view)
  super()
    @event = Event.find(event_id)
    @event_matter = @event.matters.find(event_matter_id)
    # @event_participants = @event.participants.no_email.new_participant
    # @school = School.find(school_id)
    @view = view
    header
    content
    footer
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

  def upt_pppk
    [["PEMERINTAH PROVINSI JAWA TIMUR"],
     ["DINAS PENDIDIKAN"],
     ["UPT. PELATIHAN DAN PENGEMBANGAN PENDIDIKAN KEJURUAN"],
     ["Jl. Prof. Moch. Yamin No. 25 Kampus Unesa Ketintang Surabaya, 60231"],
     ["Telp: (031) 8291795 Fax: (031) 8288677"],
     ["S U R A B A Y A"]]
  end

  def school_information
    [["", "", "", "Surabaya, #{I18n.l Time.now.localtime, :format => "%d %B %Y"}"],
     ["Nomor", ": 123/123.1/123.12/2014", "", ""],
     ["Sifat", ": Penting", "", "Kepada"],
     ["Lampiran", ": 1 (satu) lembar", "", "Yth. Sdr. Kepala #{@school.try(:name)}"],
     ["Perihal", ": Pelatihan Pengingkatan Kompetensi Guru SMK", "", "Di #{@school.try(:address)}, #{@school.try(:city).try(:name)}"]]
  end

  def header
    table upt_pppk, :cell_style => { :font => "Times-Roman", :size => 10, :height => 18 }, :width => 540 do
      cells.borders=[]
      column(0).align=:center
    end

    stroke do
      horizontal_rule
    end

    table school_information, :cell_style => { :font => "Times-Roman", :size => 10, :height => 18 }, :width => 540 do
      cells.borders=[]
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