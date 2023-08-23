package main

import "fmt"

type Customer struct {
	name string
}

func (customer *Customer) NewCustomer(name string) (c *Customer) {
	c = new(Customer)
	c.Init(name)
	return c
}

func (customer *Customer) Init(name string) {
	customer.name = name
}

func (customer *Customer) String() string {
	var retVal = fmt.Sprintf("%s", customer.name)
	return retVal
}
