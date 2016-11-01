Shoes.app width: 600, height: 500 do
  day = ask "What day?"

  pictures = Dir["../#{day}/*.jpg"].sort
  picture  = image pictures.first, width: 600

  every 0.1 do
    picture.path = pictures.shift
  end
end
