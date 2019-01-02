describe "schema_migration.sql" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_schema_migration_sql
  end

  xit "creates pokemon table" do
    # .tables should include pokemon
    expect(@db.execute("SELECT name FROM sqlite_master WHERE type IN ('table','view') AND name NOT LIKE 'sqlite_%' UNION ALL SELECT name FROM sqlite_temp_master WHERE type IN ('table','view') ORDER BY 1;")).to eq([["pokemon"]])
  end

  xit "has an autoincrementing id column" do
    expect(@db.execute("SELECT sql FROM (SELECT * FROM sqlite_master UNION ALL SELECT * FROM sqlite_temp_master) WHERE type!='meta' ORDER BY tbl_name, type DESC, name;").first.first).to include("id INTEGER PRIMARY KEY")
  end

  xit "has a name column" do
    expect(@db.execute("SELECT sql FROM (SELECT * FROM sqlite_master UNION ALL SELECT * FROM sqlite_temp_master) WHERE type!='meta' ORDER BY tbl_name, type DESC, name;").first.first).to include("name TEXT")
  end

  xit "has a type column" do
    expect(@db.execute("SELECT sql FROM (SELECT * FROM sqlite_master UNION ALL SELECT * FROM sqlite_temp_master) WHERE type!='meta' ORDER BY tbl_name, type DESC, name;").first.first).to include("type TEXT")
  end
end
