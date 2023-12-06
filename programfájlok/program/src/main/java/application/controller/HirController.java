package application.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import application.model.Comment;
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
import application.dao.CommentDAO;
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

  @Autowired
  private CommentDAO commentDAO;

  @GetMapping(value = "/")
  public String listHir(Model model) {
    List < String > user_mails = new ArrayList < String > ();
    List <Hir> hirList = hirDAO.listFrissHirek("");
    List <Hir> hirList2 = hirDAO.listFontosHirek();

    List <Hir> hirList3 = hirDAO.listTopHirek("auto");
    List <Hir> hirList4 = hirDAO.listTopHirek("belfold");
    List <Hir> hirList5 = hirDAO.listTopHirek("bulvar");
    List <Hir> hirList6 = hirDAO.listTopHirek("eletmod");
    List <Hir> hirList7 = hirDAO.listTopHirek("gazdasag");
    List <Hir> hirList8 = hirDAO.listTopHirek("kulfold");
    List <Hir> hirList9 = hirDAO.listTopHirek("sport");
    List <Hir> hirList10 = hirDAO.listTopHirek("tech");
    model.addAttribute("frisshirek", hirList);
    model.addAttribute("fontoshirek", hirList2);

    model.addAttribute("Auto", hirList3);
    model.addAttribute("Belfold", hirList4);
    model.addAttribute("Bulvar", hirList5);
    model.addAttribute("Eletmod", hirList6);
    model.addAttribute("Gazdasag", hirList7);
    model.addAttribute("Kulfold", hirList8);
    model.addAttribute("Sport", hirList9);
    model.addAttribute("Tech", hirList10);
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

  @GetMapping("/cikk/{hirid}")
  public String cikkMegtekites(@PathVariable("hirid") int hirid, Model model) {
    Hir hir = hirDAO.getHirById(hirid);
    List <Comment> commentList = commentDAO.getByNews(hirid);
    model.addAttribute("kommentek", commentList);
    model.addAttribute("hir", hir);
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication.getName().equals("anonymousUser")) {
      model.addAttribute("current_user", new User());
    } else {
      model.addAttribute("current_user", userDAO.getUserByEmail(authentication.getName()));
    }

    return "comment";
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

  @GetMapping(value = "/keres")
  public String keresHir(@RequestParam("kulcsszo") String kulcsszo, @RequestParam("kezdodatum") String kezdodatum, @RequestParam("vegdatum") String vegdatum, Model model) throws ParseException {
    List<Hir> lista = new ArrayList<>();
    if(!kezdodatum.isEmpty() && !vegdatum.isEmpty()) {
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      Date kezdodatum2 = formatter.parse(kezdodatum);
      Date vegdatum2 = formatter.parse(vegdatum);
      lista = hirDAO.keresKulcsszoDatum(kulcsszo, kezdodatum2, vegdatum2);
      model.addAttribute("kezdodatum", formatter.format(kezdodatum2));
      model.addAttribute("vegdatum", formatter.format(vegdatum2));
    } else{
      lista = hirDAO.keresKulcsszo(kulcsszo);
    }
    model.addAttribute("hirek", lista);
    model.addAttribute("kulcsszo", kulcsszo);
    return "search";
  }


  @GetMapping("/rovat/{cim}")
  public String sportRovat(@PathVariable("cim") String cim, Model model) {
    List < String > user_mails = new ArrayList < String > ();
    //List <Hir> hirList = hirDAO.listHirekRovat(cim);
    List <Hir> hirList = hirDAO.listFrissHirek(cim);
    List <Hir> hirList2 = hirDAO.listTopHirek(cim);
    List <Hir> hirList3 = hirDAO.listOldalHir(cim,"Telex");
    List <Hir> hirList4 = hirDAO.listOldalHir(cim,"HVG");
    List <Hir> hirList5 = hirDAO.listOldalHir(cim,"444");
    List <Hir> hirList6 = hirDAO.listEgyebHir(cim);
    model.addAttribute("frisshirek", hirList);
    model.addAttribute("tophirek", hirList2);
    model.addAttribute("Telex", hirList3);
    model.addAttribute("HVG", hirList4);
    model.addAttribute("444", hirList5);
    model.addAttribute("Egyeb", hirList6);

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