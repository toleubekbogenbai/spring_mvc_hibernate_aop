<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<body>

<h2>Все работники</h2>
<br>

<table>
    <tr>
        <th>Имя</th>
        <th>Фамилия</th>
        <th>Департамент</th>
        <th>Зарплата</th>
        <th>Операций</th>
    </tr>
    <c:forEach var="emp" items="${allEmps}">

        <c:url var="updateButton" value="/updateInfo">
            <c:param name="empId" value="${emp.id}"/>
        </c:url>
        <c:url var="deleteButton" value="/deleteEmployee">
            <c:param name="empId" value="${emp.id}"/>
        </c:url>

        <tr>
            <td>${emp.name}</td>
            <td>${emp.surname}</td>
            <td>${emp.department}</td>
            <td>${emp.salary}</td>
            <td>
                <input type="button" value="Изменить" onclick="window.location.href = '${updateButton}'">

                <input type="button" value="Удалить" onclick="window.location.href = '${deleteButton}'">
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<input type="button" value="Add" onclick="window.location.href = 'addNewEmployee'">






</body>
</html>