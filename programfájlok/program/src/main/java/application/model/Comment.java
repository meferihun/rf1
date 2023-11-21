package application.model;

public class Comment {
    private int id;
    private String date;
    private String content;
    private String authorName;
    private Hir hir;
    public Comment(){}

    public Comment(int id, String content, String authorName, Hir hir, String date){
        this.id = id;
        this.content = content;
        this.authorName = authorName;
        this.hir = hir;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Hir getHir() {
        return hir;
    }

    public void setHir(Hir hir) {
        this.hir = hir;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", date='" + date + '\'' +
                ", content='" + content + '\'' +
                ", authorName='" + authorName + '\'' +
                ", hir=" + hir +
                '}';
    }
}
