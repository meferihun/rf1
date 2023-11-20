package application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import application.dao.UserDAO;
import application.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
    boolean res = userDAO.insertUser(user);
    if(res){
      return "redirect:/";
    }
    return "redirect:/register?error=true";
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
  public String deleteUser(@PathVariable("username") String username, HttpServletRequest request, HttpServletResponse response) {
    userDAO.deleteUser(username);
    SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
    logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
    return "redirect:/";
  }


  @GetMapping("/profil")
  public String redirectToProfile(Principal principal) {
    String username = principal.getName();
    return "redirect:/profil/" + username;
  }

}