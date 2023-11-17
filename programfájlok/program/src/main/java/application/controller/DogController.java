package application.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import application.dao.UserDAO;
import application.dao.DogDAO;
import application.model.Dog;
import application.model.User;

@Controller
public class DogController {

  @Autowired
  private DogDAO dogDAO;

  @Autowired
  private UserDAO userDAO;
  
  
  @GetMapping(value = "/")
  public String listDog(Model model) {
    List < String > user_mails = new ArrayList < String > ();
    List < Dog > dogList = dogDAO.listDogs();
    model.addAttribute("dogs", dogList);
    for (Dog dog: dogList) {
      // user_mails.add(userDAO.getUserByUsername(dog.getOwner_id()).getEmail());
    }
    model.addAttribute("user_mails", user_mails);

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication.getName().equals("anonymousUser")) {
      model.addAttribute("current_user", new User());
    } else {
      model.addAttribute("current_user", userDAO.getUserByEmail(authentication.getName()));
    }

    return "index";
  }

  @PostMapping(value = "/add")
  public String addDog(@RequestParam("name") String name, @RequestParam("age") int age) {
    /*
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
    User user = userDAO.getUserByEmail(currentPrincipalName);
    Dog dog = new Dog(name, age, user.getId());
    dogDAO.insertDog(dog);
     */
    return "redirect:/";
  }

  @PostMapping(value = "/delete/{id}")
  public String deleteDog(@PathVariable("id") int id) {
    dogDAO.deleteDog(id);

    return "redirect:/";
  }

  @GetMapping(value = "/edit/{id}")
  public String editDog(@PathVariable("id") int id, Model model) {
    Dog dog = dogDAO.getDogById(id);
    model.addAttribute("dog", dog);

    return "update-dog";
  }

  @PostMapping(value = "/update/{id}")
  public String updateDog(@PathVariable("id") int id, @RequestParam("name") String name, @RequestParam("age") int age) {
    dogDAO.updateDog(id, name, age);

    return "redirect:/";
  }

}