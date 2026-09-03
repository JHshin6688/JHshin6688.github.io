# Local-dev only compatibility shim.
#
# `github-pages` pins liquid to 4.0.3 to match GitHub's production Jekyll
# build, but that liquid version still calls Object#tainted?, which Ruby
# 3.2+ removed. This restores a harmless no-op so `jekyll serve` runs on a
# modern local Ruby. Custom plugins do not run during GitHub's actual Pages
# build (safe mode), so this has no effect on the deployed site.
unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end

    def taint
      self
    end
  end
end
