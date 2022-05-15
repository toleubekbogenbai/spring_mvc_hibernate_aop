package com.toleubekbogenbai.spring.mvc_hibernate_aop.controller;


import com.toleubekbogenbai.spring.mvc_hibernate_aop.dao.EmployeeDAO;
import com.toleubekbogenbai.spring.mvc_hibernate_aop.entity.Employee;
import com.toleubekbogenbai.spring.mvc_hibernate_aop.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
public class MyController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/")
    public String showAllEmployees(Model model) {
        List<Employee> allEmployees = employeeService.getAllEmployees();
        model.addAttribute("allEmps", allEmployees);

        return "all-employees";
    }

    @RequestMapping("/addNewEmployee")
    public String addNewEmployee(Model model) {
        Employee employee = new Employee();
        model.addAttribute("employee", employee);
        return "employee-info";
    }

    @RequestMapping("/saveEmployee")
    public String saveEmployee(@Valid @ModelAttribute("employee") Employee employee, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "employee-info";
        }
        employeeService.saveEmployee(employee);
        return "redirect:/";
    }

    @RequestMapping("/updateInfo")
    public String updateEmployee(@RequestParam("empId") int id, Model model) {

        Employee employee = employeeService.getEmployee(id);
        model.addAttribute("employee", employee);
        return "employee-info";
    }
    @RequestMapping("/deleteEmployee")
    public String deleteEmployee(@RequestParam("empId") int id){
        employeeService.deleteEmployee(id);

        return "redirect:/";
    }
}
