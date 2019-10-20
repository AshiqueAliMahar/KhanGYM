package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import beans.UsersBean;
import interfaces.Users;

public class SignUpAction extends ActionSupport implements ModelDriven<UsersBean> {

	
	private static final long serialVersionUID = 1L;
	private UsersBean usersBean=new UsersBean();
	@Override
	public String execute() throws Exception {
		
		Users.addUser(usersBean);
		addActionMessage("Added Successfully");
		//HttpServletResponse response = ServletActionContext.getResponse();
		//response.sendRedirect("index.jsp?message=Added Successfully");
		return SUCCESS;
	}
	@Override
	public UsersBean getModel() {
		return usersBean;
	}
	public UsersBean getUsersBean() {
		return usersBean;
	}
	public void setUsersBean(UsersBean usersBean) {
		this.usersBean = usersBean;
	}

}
