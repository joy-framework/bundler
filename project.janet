(declare-project
  :name "bundler"
  :description "A very simple css and js bundler for janet"
  :author "Sean Walker"
  :license "MIT"
  :version "0.1.0"
  :dependencies ["https://github.com/joy-framework/tester"
                 "https://github.com/janet-lang/path"]
  :url "https://github.com/joy-framework/bundler"
  :repo "git+https://github.com/joy-framework/bundler")

(declare-source
  :source @["src/bundler.janet"])
