import React, { useEffect, useState } from 'react';
import { useForm, FormProvider } from 'react-hook-form';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { UIInput, UIRadio, UIDatePicker, UISelect } from '../common/ui';
import { createUser, updateUser } from '../../services/userService';
import { getJobPositions } from '../../services/jobPositionService';
import { userFormRules } from '../../formValidations/userFormRules';
import { toast } from "react-toastify";
import BaseModal from './BaseModal';

const UserFormModal = ({ user, onSuccess, onCancel }) => {
    const [jobPositions, setJobPositions] = useState([]);

    const methods = useForm({
        defaultValues: {
            name: '',
            email: '',
            phone: '',
            birth_date: null,
            gender: 'male',
            role: 'worker',
            job_position_id: '',
            password: ''
        }
    });

    const { handleSubmit, reset, watch } = methods;
    const selectedRole = watch('role');

    useEffect(() => {
        const fetchJobPositions = async () => {
            try {
                const data = await getJobPositions();
                setJobPositions(data);
            } catch (error) {
                console.error('Error fetching job positions:', error);
            }
        };
        fetchJobPositions();
    }, []);

    useEffect(() => {
        if (user) {
            const birthDateValue = user.birth_date && user.birth_date !== 'null'
                ? new Date(user.birth_date)
                : null;

            const validBirthDate = birthDateValue instanceof Date && !isNaN(birthDateValue)
                ? birthDateValue
                : null;

            reset({
                name: user.name || '',
                email: user.email || '',
                phone: user.phone || '',
                birth_date: validBirthDate,
                gender: user.gender || 'male',
                role: user.role || 'worker',
                job_position_id: user.job_position_id || '',
                password: ''
            });
        } else {
            reset({
                name: '',
                email: '',
                phone: '',
                birth_date: null,
                gender: 'male',
                role: 'worker',
                job_position_id: '',
                password: ''
            });
        }
    }, [user, reset]);

    const onSubmit = async (data) => {
        try {
            const formattedData = {
                ...data,
                birth_date: data.birth_date
                    ? data.birth_date.toISOString().split('T')[0]
                    : null
            };

            if (user) {
                await updateUser(user.id, formattedData);
            } else {
                await createUser(formattedData);
            }
            onSuccess();
            
            toast.success('User saved successfully');
        } catch (error) {
            console.error('Error saving user:', error);
        }
    };

    const rules = userFormRules({ user });

    const footer = (
        <>
            <button type="button" className="btn btn-secondary" data-bs-dismiss="modal" onClick={onCancel}>Cancel</button>
            <button type="submit" form="user-form" className="btn btn-primary">
                {user ? 'Update User' : 'Create User'}
            </button>
        </>
    );

    return (
        <BaseModal
            id="userFormModal"
            title={user ? 'Edit User' : 'Create New User'}
            icon={user ? 'user-edit' : 'user-plus'}
            size="modal-lg"
            staticBackdrop={true}
            onClose={onCancel}
            footer={footer}
        >
            <FormProvider {...methods}>
                <form id="user-form" onSubmit={handleSubmit(onSubmit)}>
                    <div className="row">
                        <div className="row">
                            <div className="col-md-6">
                                <UIInput
                                    name="name"
                                    label="Full Name"
                                    placeholder="John Doe"
                                    icon="user"
                                    rules={rules.name}
                                />
                            </div>
                            <div className="col-md-6">
                                <UIInput
                                    name="email"
                                    label="Email Address"
                                    type="email"
                                    placeholder="john@example.com"
                                    icon="envelope"
                                    rules={rules.email}
                                />
                            </div>
                            <div className="col-md-6">
                                <UIInput
                                    name="phone"
                                    label="Phone Number"
                                    placeholder="+359..."
                                    icon="phone"
                                    rules={rules.phone}
                                />
                            </div>
                            <div className="col-md-6">
                                <UIDatePicker
                                    name="birth_date"
                                    label="Birth Date"
                                    placeholder="Select date"
                                    rules={rules.birth_date}
                                />
                            </div>
                            <div className="col-md-6">
                                <UIRadio
                                    name="gender"
                                    label="Gender"
                                    options={['male', 'female', 'other']}
                                    rules={rules.gender}
                                />
                            </div>
                            <div className="col-md-6">
                                <UIRadio
                                    name="role"
                                    label="Role"
                                    options={['admin', 'worker', 'client']}
                                    rules={rules.role}
                                />
                            </div>
                            {selectedRole === 'worker' && (
                                <div className="col-md-6">
                                    <UISelect
                                        name="job_position_id"
                                        label="Job Position"
                                        options={jobPositions}
                                        icon="briefcase"
                                        placeholder="Select position..."
                                    />
                                </div>
                            )}
                            <div className="col-md-12 mt-3">
                                <UIInput
                                    name="password"
                                    label={user ? 'New Password (leave blank to keep current)' : 'Password'}
                                    type="password"
                                    placeholder="******"
                                    icon="lock"
                                    rules={rules.password}
                                />
                            </div>
                        </div>
                    </div>
                </form>
            </FormProvider>
        </BaseModal>
    );
};

export default UserFormModal;