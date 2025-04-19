<template>
    <div>
        <form>
            <div>
                <label for="first_name">First Name</label>
                <InputText v-model="form.first_name" id="first_name" />
            </div>
            <div>
                <label for="last_name">First Name</label>
                <InputText v-model="form.last_name" id="last_name" />
            </div>
            <div>
                <label for="dob">DOB</label>
                <DatePicker v-model="form.dob" id="dob" />
            </div>
            <div>
                <label for="addr_line1">Address Line 1</label>
                <InputText v-model="form.addr_line1" id="addr_line1" />
            </div>
            <div>
                <label for="addr_line2">Address Line 1</label>
                <InputText v-model="form.addr_line2" id="addr_line2" />
            </div>
            <div>
                <label for="addr_line1">Address Line 3</label>
                <InputText v-model="form.addr_line3" id="addr_line3" />
            </div>
            <div>
                <label for="addr_postcode">Address Postcode</label>
                <InputText v-model="form.addr_postcode" id="addr_postcode" />
            </div>
            <div>
                <label for="city">City</label>
                <InputText v-model="form.city" id="city" />
            </div>
            <div>
                <label for="city">Country</label>
                <InputText v-model="form.country" id="country" />
            </div>
            <div>
                <label for="city">Personal Phone</label>
                <InputText v-model="form.phone1" id="phone1" />
            </div>
            <div>
                <label for="city">Business Phone</label>
                <InputText v-model="form.phone2" id="phone2" />
            </div>

            <div>
                <label for="city">Personal Email</label>
                <InputText v-model="form.personal_email" id="personal_email" />
            </div>
            <div>
                <label for="city">Work Email</label>
                <InputText v-model="form.work_email" id="work_email" />
            </div>
            <div>
                <label for="city">ID Number</label>
                <InputText v-model="form.id_number" id="id_number" />
            </div>
            <div>
                <label for="city">Passport Number</label>
                <InputText
                    v-model="form.passport_number"
                    id="passport_number"
                />
            </div>
            <div>
                <label for="city">Nationality</label>
                <InputText v-model="form.nationality" id="nationality" />
            </div>
            <div>
                <label for="city">Hire Date</label>
                <DatePicker v-model="form.hire_date" id="hire_date" />
            </div>
            <div>
                <label for="city">Employee ID</label>
                <InputText v-model="form.employment_id" id="employment_id" />
            </div>
            <div>
                <label for="city">Preferred Name</label>
                <InputText v-model="form.preferred_name" id="preferred_name" />
            </div>
            <div>
                <Button label="Create Employee" icon="pi pi-save" />
            </div>
        </form>
    </div>
</template>

<script setup>
import { DatePicker, InputText, Select, Button } from "primevue";
import { useForm } from "@inertiajs/vue3";

const form = useForm({
    first_name: "",
    last_name: "",
    dob: "",
    addr_line1: "",
    addr_line2: "",
    addr_line3: "",
    addr_postcode: "",
    city: "",
});
</script>

<style scoped></style>
