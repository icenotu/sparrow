package com.icenotu.action;

import com.icenotu.entity.Account;
import com.icenotu.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2016-09-06.
 */
@Controller
@RequestMapping("/account")
public class AccountAction extends BaseAction {
    @Autowired
    private AccountService accountService;
    @RequestMapping("/login")
    public String login(Account account, HttpServletRequest request, HttpSession session) {
        System.out.println("---account" + account);
        Account acc = null;
        try {
            acc = accountService.login(account);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (acc != null) {
            session.setAttribute("account",acc);
//            return "/WEB-INF/pages/index/index.jsp";
            return "redirect:/base/goURL/index/index.form";
        } else {
            request.setAttribute("message","用户名或密码错误，请重新输入！");
            return "/index.jsp";
        }

    }
}
