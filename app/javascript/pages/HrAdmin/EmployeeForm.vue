<template>
    <div>
        <form @submit.prevent="$emit('onSubmit', form)">
            <div class="form-field">
                <label for="first_name">First Name</label>
                <InputText v-model="form.first_name" id="first_name" />
            </div>
            <div class="form-field">
                <label for="last_name">Last Name</label>
                <InputText v-model="form.last_name" id="last_name" />
            </div>
            <div class="form-field">
                <label for="dob">DOB</label>
                <DatePicker v-model="form.dob" id="dob" />
            </div>
            <div class="form-field">
                <Select
                    v-model="form.gender"
                    id="gender"
                    :options="genderOptions"
                    placeholder="Select Gender"
                />
            </div>
            <div class="form-field">
                <label for="addr_line1">Address Line 1</label>
                <InputText v-model="form.addr_line1" id="addr_line1" />
            </div>
            <div class="form-field">
                <label for="addr_line2">Address Line 1</label>
                <InputText v-model="form.addr_line2" id="addr_line2" />
            </div>
            <div class="form-field">
                <label for="addr_line1">Address Line 3</label>
                <InputText v-model="form.addr_line3" id="addr_line3" />
            </div>
            <div class="form-field">
                <label for="addr_postcode">Address Postcode</label>
                <InputText v-model="form.addr_postcode" id="addr_postcode" />
            </div>
            <div class="form-field">
                <label for="city">City</label>
                <InputText v-model="form.city" id="city" />
            </div>
            <div class="form-field">
                <label for="country">Country</label>
                <InputText v-model="form.country" id="country" />
            </div>
            <div class="form-field">
                <label for="phone1">Personal Phone</label>
                <InputText v-model="form.phone1" id="phone1" />
            </div>
            <div class="form-field">
                <label for="phone2">Business Phone</label>
                <InputText v-model="form.phone2" id="phone2" />
            </div>

            <div class="form-field">
                <label for="personal_email">Personal Email</label>
                <InputText v-model="form.personal_email" id="personal_email" />
            </div>
            <div class="form-field">
                <label for="work_email">Work Email</label>
                <InputText v-model="form.work_email" id="work_email" />
            </div>
            <div class="form-field">
                <label for="id_number">ID Number</label>
                <InputText v-model="form.id_number" id="id_number" />
            </div>
            <div class="form-field">
                <label for="passport_number">Passport Number</label>
                <InputText
                    v-model="form.passport_number"
                    id="passport_number"
                />
            </div>
            <div class="form-field">
                <label for="city">Nationality</label>
                <InputText v-model="form.nationality" id="nationality" />
            </div>
            <div class="form-field">
                <label for="hire_date">Hire Date</label>
                <DatePicker v-model="form.hire_date" id="hire_date" />
            </div>
            <div class="form-field">
                <label for="employment_id">Employee ID</label>
                <InputText v-model="form.employment_id" id="employment_id" />
            </div>
            <div class="form-field">
                <label for="preferred_name">Preferred Name</label>
                <InputText v-model="form.preferred_name" id="preferred_name" />
            </div>
            <div>
                <Button
                    class="action-btn"
                    type="submit"
                    :disabled="form.processing"
                    :label="submitText"
                    icon="pi pi-save"
                />
            </div>
        </form>
    </div>
</template>

<script setup>
import { DatePicker, InputText, Select, Button } from "primevue";
import { useForm } from "@inertiajs/vue3";

const form = useForm({
    first_name: employee.first_name || "",
    last_name: employee.last_name || "",
    dob: employee.dob || "",
    addr_line1: employee.addr_line1 || "",
    addr_line2: employee.addr_line1 || "",
    addr_line3: employee.addr_line3 || "",
    addr_postcode: employee.addr_postcode || "",
    city: employee.city || "",
    country: employee.country || "",
    phone1: employee.phone1 || "",
    phone2: employee.phone2 || "",
    personal_email: employee.personal_email || "",
    work_email: employee.work_email || "",
    id_number: employee.id_number || "",
    nationality: employee.nationality || "",
    passport_number: employee.passport_number || "",
    hire_date: employee.hire_date || "",
    employment_id: employee.employment_id || "",
    preferred_name: employee.preferred_name || "",
    gender: employee.gender || "",
});

const genderOptions = ["Male", "Female"];

const { employee, submitText } = defineProps(["employee", "submitText"]);
</script>

<style scoped>
.form-field {
    display: flex;
    flex-direction: column;
    margin-bottom: 1.2rem;
}
</style>
