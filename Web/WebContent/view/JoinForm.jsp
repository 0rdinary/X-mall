<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>X-mall ȸ������</title>
		
		<style>
				#wrap{
					width:530px;
					margin-left:auto;
					margin-right:auto;
					text-align:center;
				}
				table{
					margin-left:auto;
					margin-right:auto;
					border:3px solid skyblue
				}
						
				td{
					border:1px solid skyblue
				}
				#title{
					background-color:skyblue
				}
		</style>
		
		<script type="text/javascript">
			function checkValue() {
				if (!document.userInfo.user_id.value) {
					alert("���̵� �Է��ϼ���.");
					return false;
				}
				
				if (!document.userInfo.user_password.value) {
					alert("��й�ȣ�� �Է��ϼ���.");
					return false;
				}
				
				if (document.userInfo.user_password.value != document.userInfo.conf_password.value) {
					alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
					return false;
				}
				
				return true;
			}
			
			function goLoginForm() {
				location.href="loginForm.jsp";
			}
		</script>
	</head>
	<body>
		<div id="wrap">
			<br><br>
			<b><font size="6" color="gray">ȸ������</font></b>
			<br><br><br>
			
			<form method="post" action="../pro/JoinPro.jsp" name="userInfo" onsubmit="return checkValue()">
				<table>
					<tr>
						<td id="title">*���̵�(���� 11�ڸ��̳�)</td>
						<td>
							<input type="text" name="user_id" maxlength="11">
							<input type="button" value="�ߺ�Ȯ��" >
						</td>
					</tr>
					
					<tr>
						<td id="title">*��й�ȣ</td>
						<td>
							<input type="password" name="user_password" maxlength="10">
						</td>
					</tr>
					
					<tr>
						<td id="title">*��й�ȣ Ȯ��</td>
						<td>
							<input type="password" name="conf_password" maxlength="10">
						</td>
					</tr>
					
					<tr>
						<td id="title">*�ּ�</td>
						<td>
							<select name="address">
								<option value="����Ư����">����Ư����</option>
								<option value="�λ걤����">�λ걤����</option>
								<option value="�뱸������">�뱸������</option>
								<option value="��õ������">��õ������</option>
								<option value="���ֱ�����">���ֱ�����</option>
								<option value="����������">����������</option>
								<option value="��걤����">��걤����</option>
								<option value="����Ư����ġ��">����Ư����ġ��</option>
								<option value="��⵵">��⵵</option>
								<option value="������">������</option>
								<option value="��û�ϵ�">��û�ϵ�</option>
								<option value="��û����">��û����</option>
								<option value="����ϵ�">����ϵ�</option>
								<option value="���󳲵�">���󳲵�</option>
								<option value="���ϵ�">���ϵ�</option>
								<option value="��󳲵�">��󳲵�</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td id="title">*�޴���ȭ</td>
						<td>
							<input type="text" name="phone_number" maxlength="20">
						</td>
					</tr>
					
					<tr>
						<td id="title">����</td>
						<td>
							<input type="radio" name="sex" value="M" checked>��
							<input type="radio" name="sex" value="F" checked>��
							<input type="radio" name="sex" value="privacy" checked>�����
						</td>
					</tr>
					
					<tr>
						<td id="title">����(0�� �����)</td>
						<td>
							<input type="number" name="age" min = "0">
						</td>
					</tr>
					
					<tr>
						<td id="title">����</td>
						<td>
							<input type="text" name="job" maxlength="20">
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="����"/> <input type="button" value="���" onclick="goLoginForm()">
			</form>
		</div>
	</body>
</html>