task :test, [:load_dir] do | t, args|
  require 'rubygame'
  require 'test/unit'
  require_relative 'test/test.rb'

  args.with_defaults(:load_dir => 'all')
  if args.load_dir == 'all'
    all()
  else
    load(args.load_dir)
  end
end
