config = YAML.load(File.read("#{Rails.root}/config/config.yml"))

config.each do |k, v|
  ENV[k] = v
end
