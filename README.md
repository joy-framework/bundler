# bundler

Bundle js and css files with janet

## Install

Add to your `project.janet` file

```clojure
(defproject
  ... ; more stuff here
  :dependencies ["https://github.com/joy-framework/bundler"])
```

## Use

Assuming you have some `*.js` and `*.css` files in a `public/` folder your root project folder (the one with `project.janet` in it), run this:

```clojure
(import bundler)

(bundler/bundle)
```

And it should output two bundled files (the same js/css with `\n` characters between).

You can also give an explicit path to your js/css files:

```clojure
(bundler/bundle "assets")
```
