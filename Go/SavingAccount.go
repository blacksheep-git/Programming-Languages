package main

type ISavingAccount interface {
	IAccount
}
type SavingAccount struct {
	Account
	interest float64
}

func NewSavingAccount(accountNumber string, customer *Customer, balance float64) (a *SavingAccount) {
	a = new(SavingAccount)
	a.Init(accountNumber, customer, balance)
	return a
}

func (savingAccount *SavingAccount) Init(accountNumber string, customer *Customer, balance float64) {
	savingAccount.Account.Init(accountNumber, customer, balance)
	savingAccount.interest = 0
}

func (savingAccount *SavingAccount) Accrue(rate float64) {
	savingAccount.interest = savingAccount.interest + savingAccount.balance*rate
	savingAccount.balance = savingAccount.balance + savingAccount.balance*rate
}
