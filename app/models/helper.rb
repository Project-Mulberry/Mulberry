class Helper
  def self.generate_query(sql, values)
    index = 0
    while sql.include?('?')
      sql['?'] = values[index]
      index += 1
    end
    return sql
  end
end
