package ptithcm.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;

@Entity
@Table(name="Customers")
public class Customer implements Serializable{
	@Id
	@NotBlank(message="Không được để trống username")
	private String customerId;
	@Length(message="Tối thiểu 3 kí tự, tối đa 30 kí tự", min=3, max=30)
	private String password;
	@NotBlank(message="Không được để trống tên")
	private String name;
	@NotNull(message="Vui lòng chọn phái")
	private Boolean gender;
	@NotBlank(message="Vui lòng nhập địa chỉ")
	private String address;
	@NotBlank(message="Vui lòng nhập số điện thoại")
	private String phoneNumber;
	@NotBlank(message="Vui lòng nhập email")
	@Email(message="Vui lòng nhập đúng email")
	private String email;
	private String photo;
	private Boolean admin;
	
	@OneToMany(mappedBy="customer")
	private Collection<CustomerOrder> customOrder;

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(String customerId, String password, String name, Boolean gender, String address, String phoneNumber,
			String email, String photo, Boolean admin, Collection<CustomerOrder> customOrder) {
		super();
		this.customerId = customerId;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.photo = photo;
		this.admin = admin;
		this.customOrder = customOrder;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Collection<CustomerOrder> getCustomOrder() {
		return customOrder;
	}

	public void setCustomOrder(Collection<CustomerOrder> customOrder) {
		this.customOrder = customOrder;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
}