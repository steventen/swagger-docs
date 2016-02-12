namespace :swagger do

  desc "Generate Swagger documentation files"
  task :docs, [:tags] => [:environment] do |t,args|
    Swagger::Docs::Config.tags = args[:tags]
    results = Swagger::Docs::Generator.write_docs(Swagger::Docs::Config.registered_apis)
    results.each do |k,v|
      puts "#{k}: #{v[:processed].count} processed / #{v[:skipped].count} skipped"
    end
  end
end
