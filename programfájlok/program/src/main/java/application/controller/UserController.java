package application.controller;

import application.model.Dog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import application.dao.UserDAO;
import application.model.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
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

  @GetMapping(value = "/profil/{email}")
  public String editUser(@PathVariable("email") String email, Model model) {
    User user = userDAO.getUserByEmail(email);
    model.addAttribute("user", user);

    return "update-user";
  }

  @GetMapping (value = "/frissit/{name}")
  public String updateUser(@PathVariable("name") String email, @RequestParam("email") String name, @RequestParam(required = false) Boolean tiltallapot, @RequestParam("szulDatum") String szulDatum) throws ParseException {
    if(tiltallapot == null){
      tiltallapot = false;
    }
    userDAO.updateUser(email, name, tiltallapot, new SimpleDateFormat("yyyy-MM-dd").parse(szulDatum));

    return "redirect:/";
  }

  @PostMapping(value = "/torles/{username}")
  public String deleteUser(@PathVariable("username") String username) {



    userDAO.deleteUser(username);

    return "redirect:/";
  }


  @GetMapping("/profil")
  public String redirectToProfile(Principal principal) {
    String username = principal.getName();
    return "redirect:/profil/" + username;
  }



}