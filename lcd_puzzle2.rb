
require 'gtk3'
require_relative 'Controlador_LCD'

app = Gtk::Application.new

#crear la ventana
window = Gtk::Window.new
window.set_title('Display LCD')
window.set_default_size(160, 120)

#area de texto multilinea
textview = Gtk::TextView.new
font_desc = Pango::FontDescription.new("Monospace 10")
textview.override_font(font_desc)

#es crea un boton
button = Gtk::Button.new(label: 'Display')
lcd = ControladorLCD.new

#muestra si el boton es presionado 
button.signal_connect('Clicked') do
    texto = textview.buffer.text.chomp
    lcd.printLCD(tetxo)
end

#contenedor que organiza widgets en una disposición vertical o horizontal
box = Gtk::Box.new(:vertical, 5)
box.pack_start(textview, expand: true, fill:true, padding: 5)
box.pack_start(button, expand: false, fill: true, padding: 5)

window.add(box)
window.show.all

Gtk.main


