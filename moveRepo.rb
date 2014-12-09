#!/usr/bin/env ruby

def migrate(from, to)

  tmpdir = "migrate-repo-tmp"

  puts `mkdir #{tmpdir}`
  Dir.chdir("./#{tmpdir}") do
    puts `git clone --mirror #{from} .`
    puts `git remote add new_repo #{to}`
    puts `git push --all new_repo`
    puts `git push --tags new_repo`
  end

  puts "\n\n cleaning up"
  puts `rm -rf #{tmpdir}`
  puts "\n\nFin..."
  
end

repos = {
  "git@github.com:name/repo.git"=>"ssh://git@gitlab.yourdomain.com/user/repo.git",
}

repos.each do |from, to|
  migrate(from,to)
end
