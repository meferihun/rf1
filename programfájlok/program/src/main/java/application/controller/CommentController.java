package application.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import application.dao.CommentDAO;
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
import application.model.Hir;
import application.model.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class CommentController {

    @Autowired
    private HirDAO hirDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private CommentDAO commentDAO;

    @GetMapping(value = "/")
    public String listComments(Model model){
        List < String > user_mails = new ArrayList < String > ();
        List <Comment> commentList = commentDAO.getAll();
        model.addAttribute("kommentek", commentList);
        for (Comment comment: commentList) {
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

    @PostMapping(value = "/add")
    public String addComment(@RequestParam("content") String content, @RequestParam("authorName") String authorName, @RequestParam("hir") Hir hir, @RequestParam("date") String date) throws ParseException{
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User user = userDAO.getUserByEmail(currentPrincipalName);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String kozetevesdatumaDate = formatter.format(date);
        Comment comment = new Comment(0,content, authorName,hir,kozetevesdatumaDate);
        commentDAO.create(comment);

        return "redirect:/";
    }

    @PostMapping(value = "/delete/{kommentid}")
    public String deleteComment(@PathVariable("kommentid") int kommentid){
        commentDAO.delete(kommentid);
        return "redirect:/";
    }

    public String updateComment(String content, String authorName, Hir hir){
        return "redirect:/";
    }

}
