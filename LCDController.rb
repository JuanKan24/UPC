class LCDController
    def initialize
    @display = I2C::Drivers::LCD::Display.new('/dev/i2c-1',
    0x27, rows: 4, cols: 20)
    end
    def printLCD(texto)
    @display.clear
    lineas = texto.split("\n")
    lineas.each_with_index do |linea, index|
    @display.text(linea[0, 20], index) if index < 4
    end
    end
    end


#Funciones para centrar el mensaje escrito en LCD

    def printCenter(mensaje)
        space = [(20-mensaje.length)/2, 0].max
        mensajeCenter=" " * space + mensaje
        printLCD(mensajeCenter)
    end
end