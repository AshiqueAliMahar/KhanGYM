package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import beans.UsersBean;
import interfaces.Users;

public class UsersAction extends ActionSupport implements ModelDriven<UsersBean> {
	
	private static final long serialVersionUID = 1L;
	private UsersBean usersBean=new UsersBean();
	private String message;
	
	@Override
	public String execute() throws Exception {
		
		return super.execute();
	}
	public String logIn() {
		HttpServletRequest req = ServletActionContext.getRequest();
		
		usersBean = Users.getUser(usersBean.getEmail(), usersBean.getPassword());
		
		if (!org.apache.commons.lang3.StringUtils.isEmpty(usersBean.getName())) {
			req.getSession().setAttribute("log",true);
			req.getSession().setAttribute("name",usersBean.getName());
			return SUCCESS;
		}else {
			message="Incorrect Email or Password";
			return LOGIN;
		}
	}
	public String logOut() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().invalidate();
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
