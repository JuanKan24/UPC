require 'i2c/drivers/lcd'

# Nueva funcion para inicializar el LCD y procesar el texto
def escribir_en_lcd(texto)
  display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27, rows = 20, cols = 4)
  display.clear


  if texto.empty?
    puts "El texto esta vacio."
  elsif texto.length <= 20
    display.text(texto, 0)  
  else
 
    display.text(texto[0, 20], 0)
    display.text(texto[20, 40], 1)
    display.text(texto[40, 60], 2)
    display.text(texto[60..-1], 3)
  end
end

# Lee el texto de la consola y escribe en el LCD
puts 'Ingrese un texto y presione ENTER:'
input_texto = gets.chomp  # Leer input hasta que se presione ENTER

escribir_en_lcd(input_texto)
