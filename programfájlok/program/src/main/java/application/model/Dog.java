package application.model;

import java.io.Serializable;

public class Dog implements Serializable {

  private static final long serialVersionUID = 1L;

  int id;
  String name;
  int age;
  int owner_id;

  public Dog() {}

  public Dog(int id, String name, int age, int owner_id) {
    this.id = id;
    this.name = name;
    this.age = age;
    this.owner_id = owner_id;
  }

  public Dog(String name, int age, int owner_id) {
    this.name = name;
    this.age = age;
    this.owner_id = owner_id;
  }

  public int getOwner_id() {
    return owner_id;
  }

  public void setOwner_id(int owner_id) {
    this.owner_id = owner_id;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  @Override
  public String toString() {
    return "Dog [id=" + id + ", name=" + name + ", age=" + age + ", owner=" + owner_id + "]";
  }

}