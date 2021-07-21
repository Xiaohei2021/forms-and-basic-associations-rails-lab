class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes=(notes)
    notes.each do |note|
      if note != ""
        note = Note.create(content: note, song_id: self.id)
        self.notes << note
      end
    end
  end

  def song_notes
    self.notes.map do |note|
      note.content
    end

  end


end
