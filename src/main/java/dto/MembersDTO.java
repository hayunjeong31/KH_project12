package dto;

import java.sql.Timestamp;

public class MembersDTO {
    private int userSeq;
    private String userId;
    private String userPwd;
    private String userName;
    private String nickName;
    private String phone;
    private String email;
    private String gender;
    private String signout;
    private String birth_date;
    private Timestamp join_date;
    private Timestamp upd_date;
    private int adminKey;
    private String tempCode;

    public MembersDTO() {
    	super();
    }

    public MembersDTO(int userSeq, String userId, String userPwd, String userName, String nickName, String phone, 
    		String email, String gender, String signout, String birth_date, Timestamp join_date, Timestamp upd_date, 
    		int adminKey, String tempCode) {
    	this.userSeq = userSeq;
    	this.userId=userId;
    	this.userPwd=userPwd;
    	this.userName=userName;
    	this.nickName=nickName;
    	this.phone=phone;
    	this.email=email;
    	this.gender = gender;
    	this.signout=signout;
    	this.birth_date=birth_date;
    	this.join_date=join_date;
    	this.upd_date=upd_date;
    	this.adminKey=adminKey;
    	this.tempCode=tempCode;
    }

    public MembersDTO(int userSeq, String userId, String userPwd, String userName, String nickName, String phone, String email, String gender, String signout, String birth_date, Timestamp join_date, Timestamp upd_date, int adminKey, String tempCode) {

    public MembersDTO(int userSeq, String userId, String userPwd, String userName, String nickName, String phone,
    		String email, String gender, String signout, String birth_date, Timestamp join_date, Timestamp upd_date,
    		int adminKey, String tempCode) {

        this.userSeq = userSeq;
        this.userId = userId;
        this.userPwd = userPwd;
        this.userName = userName;
        this.nickName = nickName;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
        this.signout = signout;
        this.birth_date = birth_date;
        this.join_date = join_date; 
        this.upd_date = upd_date;
        this.adminKey = adminKey;
        this.tempCode = tempCode;
    }

    public int getUserSeq() {
        return userSeq;
    }

    public void setUserSeq(int userSeq) {
        this.userSeq = userSeq;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSignout() {
        return signout;
    }

    public void setSignout(String signout) {
        this.signout = signout;
    }

    public String getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(String birth_date) {
        this.birth_date = birth_date;
    }

    public Timestamp getJoin_date() {
        return join_date;
    }

    public void setJoin_date(Timestamp join_date) {
        this.join_date = join_date;
    }

    public Timestamp getUpd_date() {
        return upd_date;
    }

    public void setUpd_date(Timestamp upd_date) {
        this.upd_date = upd_date;
    }

    public int getAdminKey() {
        return adminKey;
    }

    public void setAdminKey(int adminKey) {
        this.adminKey = adminKey;
    }

    public String getTempCode() {
        return tempCode;
    }

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSignout() {
		return signout;
	}

	public void setSignout(String signout) {
		this.signout = signout;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}
	
	public String getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public Timestamp getUpd_date() {
		return upd_date;
	}

	public void setUpd_date(Timestamp upd_date) {
		this.upd_date = upd_date;
	}

	public int getAdminKey() {
		return adminKey;
	}

	public void setAdminKey(int adminKey) {
		this.adminKey = adminKey;
	}
	
	public String getTempCode() {
		return tempCode;
	}
	
	public void setTempCode(String tempCode) {
		this.tempCode = tempCode;
	}
}
