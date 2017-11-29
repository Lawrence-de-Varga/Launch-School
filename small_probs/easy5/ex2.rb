def after_midnight(integer)
  hours, minutes = (integer % 1440).divmod(60)
  "#{hours < 10 ? "0#{hours}" : hours}:#{minutes < 10 ? "#{minutes}0" : minutes}"
end
