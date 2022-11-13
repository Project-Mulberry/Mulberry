class Helper
  def self.generate_query(original_sql, values)
    sql = original_sql.dup
    index = 0
    while sql.include?('?')
      sql['?'] = values[index]
      index += 1
    end
    return sql
  end
end
