<template>
    <div>
        <div>
            <Button
                label="New Employee Pay"
                icon="pi pi-plus"
                @click="visible = true"
                class="pay-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Employee Pay"
            :visible="visible"
            @update:visible="visible = $event"
            :style="{ width: '50vw' }"
        >
            <form @submit.prevent="saveEmployeePay">
                <div class="flex flex-col mb-2">
                    <label class="label" for="start_date">Start date</label>
                    <input
                        type="date"
                        name="start_date"
                        id="start_date"
                        v-model="form.start_date"
                    />
                    <div v-if="form.errors.start_date" class="error">
                        {{ form.errors.start_date.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="end_date">End date</label>
                    <input
                        type="date"
                        name="end_date"
                        id="end_date"
                        v-model="form.end_date"
                    />
                    <div v-if="form.errors.end_date" class="error">
                        {{ form.errors.end_date.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Select Pay Type"
                        :options="pay_type_options"
                        optionLabel="name"
                        optionValue="value"
                        v-model="form.pay_type"
                    />
                    <div v-if="form.errors.pay_type" class="error">
                        {{ form.errors.pay_type.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Select Currency"
                        :options="currency_options"
                        optionLabel="name"
                        optionValue="value"
                        v-model="form.currency"
                    />
                    <div v-if="form.errors.currency" class="error">
                        {{ form.errors.currency.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Select Frequency"
                        :options="frequency_options"
                        optionLabel="name"
                        optionValue="value"
                        v-model="form.frequency"
                    />
                    <div v-if="form.errors.frequency" class="error">
                        {{ form.errors.frequency.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="amount">Amount</label>
                    <InputNumber
                        name="amount"
                        id="amount"
                        v-model="form.amount"
                    />
                    <div v-if="form.errors.amount" class="error">
                        {{ form.errors.amount.join(", ") }}
                    </div>
                </div>
                <div>
                    <Button
                        class="pay-btn"
                        type="submit"
                        :disabled="form.processing"
                        label="Save Employee Pay"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import {
    Dialog,
    Select,
    InputText,
    Button,
    InputNumber,
    DatePicker,
} from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const employee = computed(() => page.props.employee).value;
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    start_date: "",
    end_date: "",
    amount: 0,
    pay_type: "",
    currency: "",
    frequency: "",
});

const visible = ref(false);

defineProps({
    currency_options: Array,
    pay_type_options: Array,
    frequency_options: Array,
});

function saveEmployeePay() {
    form.transform((data) => ({ employee_pay: data }));
    form.post(`/employees/${employee.id}/employee_pays`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.pay-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
