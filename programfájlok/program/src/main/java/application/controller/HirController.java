package application.controller;

import java.text.ParseException;
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
import application.dao.HirDAO;
import application.model.Hir;
import application.model.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class HirController {

  @Autowired
  private HirDAO hirDAO;

  @Autowired
  private UserDAO userDAO;


  @GetMapping(value = "/")
  public String listHir(Model model) {
    List < String > user_mails = new ArrayList < String > ();
    List <Hir> hirList = hirDAO.listHirek();
    model.addAttribute("hirek", hirList);
    for (Hir hir: hirList) {
      // user_mails.add(userDAO.getUserByUsername(hir.getOwner_id()).getEmail());
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

  @GetMapping(value = "/admin")
  public String listHirFelhasznalok(Model model) {
    List < String > user_mails = new ArrayList < String > ();
    List <Hir> hirList = hirDAO.listHirek();
    model.addAttribute("hirek", hirList);


    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication.getName().equals("anonymousUser")) {
      model.addAttribute("current_user", new User());
    } else {
      model.addAttribute("current_user", userDAO.getUserByEmail(authentication.getName()));
    }

    List <User> userList = userDAO.listUsers();
    model.addAttribute("felhasznalok", userList);

    return "admin";
  }

  @GetMapping("/incrementViewCount/{hirid}")
  public String incrementViewCount(@PathVariable("hirid") int hirid) {
    hirDAO.incrementViewCount(hirid);
    Hir hir = hirDAO.getHirById(hirid);
    return "redirect:" + hir.getForras();
  }

  @PostMapping(value = "/add")
  public String addHir(@RequestParam("cim") String cim, @RequestParam("kozetevesdatuma") String kozetevesdatuma, @RequestParam("megtekintesekszama") int megtekintesekszama, @RequestParam(value = "fontose", defaultValue = "false") boolean fontose, @RequestParam("forras") String forras, @RequestParam("honnan") String honnan, @RequestParam("kategoria") String kategoria) throws ParseException {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
    User user = userDAO.getUserByEmail(currentPrincipalName);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date kozetevesdatumaDate = formatter.parse(kozetevesdatuma);
    Hir hir = new Hir(0, cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan, kategoria);
    hirDAO.insertHir(hir);

    return "redirect:/admin";
  }

  @GetMapping(value = "/delete/{hirid}")
  public String deleteHir(@PathVariable("hirid") int hirid) {
    hirDAO.deleteHir(hirid);
    return "redirect:/";
  }

  @GetMapping(value = "/edit/{hirid}")
  public String editHir(@PathVariable("hirid") int hirid, Model model) {
    Hir hir = hirDAO.getHirById(hirid);
    model.addAttribute("hir", hir);

    return "update-hir";
  }

  @PostMapping(value = "/update/{hirid}")
  public String updateHir(@PathVariable("hirid") int hirid, @RequestParam("cim") String cim, @RequestParam("kozetevesdatuma") String kozetevesdatuma, @RequestParam("megtekintesekszama") int megtekintesekszama, @RequestParam(value = "fontose", defaultValue = "false") boolean fontose, @RequestParam("forras") String forras, @RequestParam("honnan") String honnan, @RequestParam("kategoria") String kategoria) {
    hirDAO.updateHir(hirid, cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan, kategoria);

    return "redirect:/admin";
  }

  @GetMapping("/rovat/{cim}")
  public String sportRovat(@PathVariable("cim") String cim, Model model) {
    List < String > user_mails = new ArrayList < String > ();
    List <Hir> hirList = hirDAO.listHirekRovat(cim);
    model.addAttribute("rovathirek", hirList);

    String rovatcime = "";
    switch (cim) {
      case "auto":
        rovatcime = "Autó";
        break;
      case "belfold":
        rovatcime = "Belföld";
        break;
      case "bulvar":
        rovatcime = "Bulvár";
        break;
      case "eletmod":
        rovatcime = "Életmód";
        break;
      case "gazdasag":
        rovatcime = "Gazdaság";
        break;
      case "kulfold":
        rovatcime = "Külföld";
        break;
      case "sport":
        rovatcime = "Sport";
        break;
      case "tech":
        rovatcime = "Tech";
        break;
    }

    model.addAttribute("rovatcim", rovatcime);


    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication.getName().equals("anonymousUser")) {
      model.addAttribute("current_user", new User());
    } else {
      model.addAttribute("current_user", userDAO.getUserByEmail(authentication.getName()));
    }

     return "rovat-hirek";
  }

}