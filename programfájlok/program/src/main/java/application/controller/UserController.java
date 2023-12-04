package application.controller;

import application.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.Authentication;
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
import java.util.ArrayList;

@Controller
public class UserController {

  @Autowired
  private UserDAO userDAO;

  @Autowired
  EmailService emailService;

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
      //emailService.sendWelcomeMessage(email,felhasznalonev);
      return "redirect:/register?success=true";
    }
    return "redirect:/register?error=true";
  }

  @GetMapping(value = "/profil/{email}")
  public String editUser(@PathVariable("email") String email, Model model) {
    User user = userDAO.getUserByEmail(email);
    model.addAttribute("user", user);
    model.addAttribute("flag1",userDAO.kategoriaLetezik(email,"Belfold"));
    model.addAttribute("flag2",userDAO.kategoriaLetezik(email,"Kulfold"));
    model.addAttribute("flag3",userDAO.kategoriaLetezik(email,"Gazdasag"));
    model.addAttribute("flag4",userDAO.kategoriaLetezik(email,"Sport"));
    model.addAttribute("flag5",userDAO.kategoriaLetezik(email,"Tech"));
    model.addAttribute("flag6",userDAO.kategoriaLetezik(email,"Bulvar"));
    model.addAttribute("flag7",userDAO.kategoriaLetezik(email,"Eletmod"));
    model.addAttribute("flag8",userDAO.kategoriaLetezik(email,"Auto"));

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication.getName().equals("anonymousUser")) {
      model.addAttribute("current_user", new User());
    } else {
      model.addAttribute("current_user", userDAO.getUserByEmail(authentication.getName()));
    }

    return "update-user";
  }

  @GetMapping (value = "/frissit/{name}")
  public String updateUser(@PathVariable("name") String email, @RequestParam("email") String name, @RequestParam(required = false) Boolean tiltallapot,
                           @RequestParam("szulDatum") String szulDatum, @RequestParam(value = "belfold", defaultValue = "false Belfold") String belfold,
                           @RequestParam(value = "kulfold", defaultValue = "false Kulfold") String kulfold,
                           @RequestParam(value = "gazdasag", defaultValue = "false Gazdasag") String gazdasag, @RequestParam(value = "sport", defaultValue = "false Sport") String sport,
                           @RequestParam(value = "tech", defaultValue = "false Tech") String tech, @RequestParam(value = "bulvar", defaultValue = "false Bulvar") String bulvar,
                           @RequestParam(value = "eletmod", defaultValue = "false Eletmod") String eletmod, @RequestParam(value = "auto",defaultValue = "false Auto") String auto,
                           Model model) throws ParseException {


    if(tiltallapot == null){
      tiltallapot = false;
    }
    ArrayList<String> kategoriak = new ArrayList<>();
    kategoriak.add(belfold);
    kategoriak.add(kulfold);
    kategoriak.add(gazdasag);
    kategoriak.add(sport);
    kategoriak.add(tech);
    kategoriak.add(bulvar);
    kategoriak.add(eletmod);
    kategoriak.add(auto);
    userDAO.updateUser(email, name, tiltallapot, new SimpleDateFormat("yyyy-MM-dd").parse(szulDatum), kategoriak);

    return "redirect:/profil/" + email;
  }


  @PostMapping(value = "/jelszomodositas")
  public String jelszoModositas(@RequestParam("email2") String email, @RequestParam("jelszo") String jelszo, @RequestParam("jelszoUjra") String jelszoUjra){
    User user = userDAO.getUserByEmail(email);
    if (!jelszo.equals(jelszoUjra)){
      return "redirect:/profil/" + user.getEmail() + "?error=true";
    } else {
      userDAO.modifyPassword(email, jelszo);
      return "redirect:/profil/" + user.getEmail() + "?success=true";
    }
  }

  @PostMapping(value = "/torles/{username}/{currentuser}")
  public String deleteUser(@PathVariable("username") String username, @PathVariable("currentuser") String currentuser, HttpServletRequest request, HttpServletResponse response) {
    userDAO.deleteUser(username);
    //Principal principal = request.getUserPrincipal();
    //emailService.sendGoodbyeMessage(principal.getName(),username);
    if(currentuser.equals(username)) {
      SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
      logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
    }
    return "redirect:/";
  }


  @GetMapping("/profil")
  public String redirectToProfile(Principal principal) {
    String username = principal.getName();

    return "redirect:/profil/" + username;
  }

}