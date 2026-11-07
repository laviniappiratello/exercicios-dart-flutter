
class Triangulo {
  double base;
  double altura;

  Triangulo(this.base, this.altura);

  double calcularArea() {
    return (base * altura) / 2;
  }
}

void main() {
  Triangulo t = Triangulo(10, 5);
  print('Base: ${t.base} | Altura: ${t.altura}');
  print('Área: ${t.calcularArea()}');
}
