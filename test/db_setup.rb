class SetupDatabase
  def filename
    "db/#{ENV['RACK_ENV']}.sqlite3"
  end

  def db
    Sequel.sqlite(filename)
  end

  def go
    db.run "CREATE TABLE pages
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    string VARCHAR(255),
    foreign_key VARCHAR(255)
    )"
  end

  def teardown
    system("rm #{filename}")
  end
end
