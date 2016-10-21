class HyperFastCGI < FPM::Cookery::Recipe
  description 'Performant nginx to mono fastcgi server'

  v = 'master'
  name     'hyperfastcgi'
  version  "0.4"
  revision 1
  homepage 'https://github.com/xplicit/HyperFastCgi'
  source   "https://github.com/xplicit/HyperFastCgi", :with => :git, :branch => "#{v}"

  build_depends 'autoconf', 'automake', 'libtool', 'make', 'libglib2.0-dev', 'libevent-dev', 'pkg-config', 'mono-complete', 'libevent-dev'

  def build
    autogen :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
