<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

<h2>Заполните данные</h2>
<br>
<form:form action="saveEmployee" modelAttribute="employee">
    <form:hidden path="id"/>
    Имя: <form:input path="name"/>
    <form:errors path="name"/>
    <br><br>
    Фамилия: <form:input path="surname"/>
    <form:errors path="surname"/>
    <br><br>
    Департамент: <form:input path="department"/>
    <form:errors path="department"/>
    <br><br>
    Зарплата: <form:input path="salary"/>
    <br><br>
    <input type="submit" value="OK">



</form:form>



</body>
</html>