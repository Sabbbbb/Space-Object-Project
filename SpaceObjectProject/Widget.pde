class Widget {
  int x, y, width, height;
  String label;
  String finalLabel;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  int xText;
  color strokeColorNorm = color(0);

  Widget(int x, int y, int width, int height, int xText,
    String label, color widgetColor, PFont font, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height = height;
    this.xText = xText;
    this.label = label;
    this.event = event;
    this.widgetColor = widgetColor;
    this.widgetFont = font;
    labelColor = color(0);
  }

  void draw() {
    fill(widgetColor);
    stroke(strokeColorNorm);
    rect(x, y, width, height);
    fill(labelColor);
    textSize(10);
    textFont(widgetFont);
    text(label, x+xText, y+height-13);
  }

  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
  String getLabel() {
    finalLabel = label;
    return finalLabel;
  }
}
