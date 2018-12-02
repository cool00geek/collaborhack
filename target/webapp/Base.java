class Base {

    JspWriter out;

    public Base(JspWriter out) {
        this.out = out;
    }

    public void main() {
        String Text = "ThisIsText";
        try {
            out.println(Text);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}