(import path)

(def- css? (partial string/has-suffix? ".css"))
(def- js? (partial string/has-suffix? ".js"))
(def- bundle? (partial string/has-prefix? "bundle"))
(def- file-exists-error? (partial string/has-prefix? "No such file or directory"))


(defn- read-file [filename]
  (with [f (file/open filename :r)]
    (file/read f :all)))


(defn- write-file [filename contents]
  (with [f (file/open filename :w)]
    (file/write f contents)))


(defn- clean [folder]
  (try
    (as-> folder ?
          (os/dir ?)
          (filter bundle? ?)
          (map |(path/join folder $) ?)
          (map os/rm ?))
    ([err fib]
     (unless (file-exists-error? err)
       (propagate err fib)))))


(defn- bundle-files [folder filenames ext]
  (let [contents (as-> filenames ?
                       (map read-file ?)
                       (string/join ? "\n"))
        hash1 (hash contents)
        bundle-name (string "bundle" hash1 ext)]
    (write-file (path/join folder bundle-name)
                contents)
    bundle-name))


(defn bundle [&opt folder]
  (default folder "public")
  (clean folder)
  (let [files (sort (os/dir folder))
        files (filter |(not (bundle? $)) files)
        css-files (->> (filter css? files)
                       (map |(path/join folder $)))
        js-files (->> (filter js? files)
                      (map |(path/join folder $)))]

    (unless (empty? css-files)
      (bundle-files folder css-files ".css"))

    (unless (empty? js-files)
      (bundle-files folder js-files ".js"))))
