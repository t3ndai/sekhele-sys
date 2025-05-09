<template>
    <div>
        <div>
            <Button
                label="New Benefit Plan"
                icon="pi pi-plus"
                @click="visible = true"
                class="benefit-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Benefit Plan"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveBenefitPlan">
                <div class="flex flex-col mb-2 field">
                    <label for="name">Name</label>
                    <InputText id="name" v-model="form.name" />
                </div>

                <div class="flex flex-col mb-2 field">
                    <label for="employer_contribution"
                        >Employer Contribution</label
                    >
                    <InputNumber
                        id="employer_contribution"
                        mode="currency"
                        currency="USD"
                        locale="en-US"
                        v-model="form.employer_contribution"
                    />
                </div>

                <div class="flex flex-col mb-2 field">
                    <label for="employee_contribution"
                        >Employee Contribution</label
                    >
                    <InputNumber
                        id="employee_contribution"
                        mode="currency"
                        currency="USD"
                        locale="en-US"
                        v-model="form.employee_contribution"
                    />
                </div>

                <div class="flex flex-col mb-2 field">
                    <label for="employee_contribution">Documents</label>
                    <input
                        type="file"
                        multiple
                        @change="form.documents = $event.target.files"
                    />
                </div>

                <div class="field mb-2">
                    <fieldset class="radios">
                        <legend>Cover Type</legend>
                        <div class="flex gap-x-2">
                            <div class="flex" v-for="cover_type in cover_types">
                                <RadioButton
                                    v-model="form.cover"
                                    :inputId="cover_type.name"
                                    name="dynamic"
                                    :value="cover_type.value"
                                />
                                <label for="cover_type.name">{{
                                    cover_type.name
                                }}</label>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div class="mt-2">
                    <Button
                        class="benefit-btn"
                        label="Save"
                        icon="pi pi-save"
                        type="submit"
                        :disabled="form.processing"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import {
    Dialog,
    Button,
    Select,
    RadioButton,
    InputText,
    InputNumber,
} from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const visible = ref(false);

const props = defineProps({
    benefit: Object,
    cover_types: Array,
});

const form = useForm({
    name: "",
    documents: [],
    employee_contribution: "",
    employer_contribution: "",
    cover: "",
});

function saveBenefitPlan() {
    const { benefit } = props;
    form.transform((data) => ({ benefit_plan: data }));
    form.post(`/benefits/${benefit.id}/benefit_plans`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.benefit-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
