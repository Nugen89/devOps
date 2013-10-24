execute "install graphicsmagick" do
  command "apt-get -y install graphicsmagick"
  action :run
end

execute "install poppler" do
  command "apt-get -y install poppler-utils poppler-data"
  action :run
end

execute "install ghostscript" do
  command "apt-get -y install ghostscript"
  action :run
end

# execute "install tesseract" do
#   command "apt-get -y install tesseract"
#   action :run
# end

# execute "install tesseract" do
#   command "apt-get -y install tesseract-ocr"
#   action :run
# end

execute "install pdftk" do
  command "apt-get -y install pdftk"
  action :run
end

execute "install libreoffice" do
  command "apt-get -y install libreoffice"
  action :run
end
