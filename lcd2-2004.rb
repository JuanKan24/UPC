require 'i2c/drivers/lcd'

def escribir_en_lcd(texto)
  display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27, rows = 20, cols = 4)
  display.clear

  # Mostrar cada linea en el LCD
  texto.each_with_index do |linea, index|
    display.text(linea.ljust(20), index) if index < 4
  end
end

# Captura de multiples lineas
def capturar_entradas
  entradas = []

  # 5.times do |i|
  #   puts "Ingrese linea #{i + 1} y presione ENTER:"
  #   entrada = gets.chomp
  #   entradas << entrada
  # end


  for i in 0...4
    puts "Ingrese linea #{i + 1} y presione ENTER:"
    entrada = gets.chomp
    entradas << entrada
  end

  # Devuelve solo las ultimas 4 entradas
  entradas.last(4)
end

# Captura las entradas y las muestra en el LCD
texto_a_mostrar = capturar_entradas
escribir_en_lcd(texto_a_mostrar)
