class AccountValidator

  def validate_user(user)
    raise NotImplementedError, "Subclasses must define 'validate_user'."
  end
end