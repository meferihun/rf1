package application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import application.dao.UserDAO;
import application.model.User;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@Controller
public class UserController {

  @Autowired
  private UserDAO userDAO;

  @GetMapping("/register")
  public String register() {
    return "register";
  }

  @GetMapping("/login")
  public String login() {
    return "login";
  }

  @PostMapping(value = "/registeruser")
  public String registerUser(@RequestParam("felhasznalonev") String felhasznalonev, @RequestParam("email") String email, @RequestParam("jelszo") String jelszo, @RequestParam("jelszoUjra") String jelszoUjra, @RequestParam("szulDatum") String szulDatum, @RequestParam("jogosultsag") String jogosultsag) throws ParseException {
    User user = new User(felhasznalonev, email, jelszo, jelszoUjra, new SimpleDateFormat("yyyy-MM-dd").parse(szulDatum), jogosultsag);
    userDAO.insertUser(user);
    return "redirect:/";
  }

}