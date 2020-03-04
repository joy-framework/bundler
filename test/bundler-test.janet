(import tester :prefix "" :exit true)
(import ../src/bundler :as bundler)

(deftest
  (test "a bundled file is created from css and js files"
    (do
      (bundler/bundle)

      (let [css (with [f (file/open "public/bundle-1212874607.css")]
                  (file/read f :all))
            js (with [f (file/open "public/bundle-1416178157.js")]
                 (file/read f :all))]
        (and (deep= css @"/* _dep.css */\n/* app.css */")
             (deep= js @"// _dep.js\n// app.js"))))))
